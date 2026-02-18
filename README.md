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
Updated: 2026-02-18T05:56:51.111236+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.042 |  |
| ap-east-1 | 0.662 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.880 |  |
| ap-south-2 | 0.866 |  |
| ap-southeast-1 | 0.733 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.788 |  |
| ap-southeast-4 | 0.660 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.658 |  |
| ap-southeast-7 | 0.836 |  |
| ca-central-1 | 0.256 | 16 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.560 |  |
| eu-central-2 | 0.586 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.551 |  |
| il-central-1 | 0.745 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.894 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.666 |  |
| us-east-1 | 0.212 | 4137 |
| us-east-2 | 0.188 | 1353 |
| us-gov-east-1 | 0.189 | 1487 |
| us-gov-west-1 | 0.139 | 153 |
| us-west-1 | 0.103 | 3072 |
| us-west-2 | 0.145 | 126 |

