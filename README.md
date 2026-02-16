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
Updated: 2026-02-16T14:01:28.849320+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.661 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.802 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.110 | 4129 |
| us-east-2 | 0.090 | 1348 |
| us-gov-east-1 | 0.087 | 1478 |
| us-gov-west-1 | 0.210 | 149 |
| us-west-1 | 0.223 | 3065 |
| us-west-2 | 0.214 | 126 |

