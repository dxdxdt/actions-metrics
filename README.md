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
Updated: 2026-08-22T18:17:49.554254+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.208 | 18 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.638 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.150 | 5047 |
| us-east-2 | 0.165 | 1681 |
| us-gov-east-1 | 0.166 | 1869 |
| us-gov-west-1 | 0.212 | 225 |
| us-west-1 | 0.157 | 4024 |
| us-west-2 | 0.211 | 184 |

