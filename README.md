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
Updated: 2026-03-11T16:42:26.372168+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.544 |  |
| ap-south-1 | 0.945 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.186 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.507 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.549 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.835 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.163 | 4259 |
| us-east-2 | 0.162 | 1419 |
| us-gov-east-1 | 0.131 | 1561 |
| us-gov-west-1 | 0.179 | 179 |
| us-west-1 | 0.180 | 3210 |
| us-west-2 | 0.178 | 144 |

