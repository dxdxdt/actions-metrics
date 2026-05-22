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
Updated: 2026-05-22T13:25:19.434473+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.808 |  |
| ap-east-2 | 0.747 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.850 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.935 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 0.990 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.447 |  |
| eu-south-1 | 0.437 |  |
| eu-south-2 | 0.439 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.065 | 4674 |
| us-east-2 | 0.083 | 1606 |
| us-gov-east-1 | 0.082 | 1700 |
| us-gov-west-1 | 0.321 | 195 |
| us-west-1 | 0.257 | 3587 |
| us-west-2 | 0.320 | 158 |

