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
Updated: 2026-04-10T12:52:30.836120+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.867 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.449 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.086 | 4472 |
| us-east-2 | 0.101 | 1490 |
| us-gov-east-1 | 0.103 | 1638 |
| us-gov-west-1 | 0.283 | 192 |
| us-west-1 | 0.239 | 3387 |
| us-west-2 | 0.276 | 154 |

