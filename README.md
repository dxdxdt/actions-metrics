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
Updated: 2026-05-09T14:17:16.229321+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.622 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.771 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.867 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.441 |  |
| eu-north-1 | 0.460 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.074 | 4617 |
| us-east-2 | 0.068 | 1579 |
| us-gov-east-1 | 0.068 | 1682 |
| us-gov-west-1 | 0.278 | 195 |
| us-west-1 | 0.225 | 3542 |
| us-west-2 | 0.273 | 157 |

