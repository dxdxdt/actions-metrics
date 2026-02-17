# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-17T05:53:22.269595+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.670 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.976 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.810 |  |
| mx-central-1 | 0.195 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.103 | 4134 |
| us-east-2 | 0.091 | 1348 |
| us-gov-east-1 | 0.087 | 1484 |
| us-gov-west-1 | 0.223 | 150 |
| us-west-1 | 0.230 | 3066 |
| us-west-2 | 0.220 | 126 |

