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
Updated: 2026-08-23T20:13:43.364798+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.993 |  |
| ap-east-1 | 0.669 |  |
| ap-east-2 | 0.610 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.801 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.684 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.220 | 18 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.539 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.176 | 5050 |
| us-east-2 | 0.182 | 1681 |
| us-gov-east-1 | 0.157 | 1873 |
| us-gov-west-1 | 0.164 | 226 |
| us-west-1 | 0.137 | 4040 |
| us-west-2 | 0.163 | 185 |

