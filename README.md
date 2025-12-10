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
Updated: 2025-12-10T23:11:43.716688+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.768 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.693 |  |
| ap-south-1 | 0.851 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.742 |  |
| ca-central-1 | 0.132 | 15 |
| eu-central-1 | 0.457 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.490 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.444 |  |
| me-south-1 | 0.770 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.105 | 3681 |
| us-east-2 | 0.102 | 1142 |
| us-gov-east-1 | 0.097 | 1247 |
| us-gov-west-1 | 0.235 | 91 |
| us-west-1 | 0.230 | 2619 |
| us-west-2 | 0.242 | 65 |

