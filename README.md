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
Updated: 2026-08-09T05:43:26.335270+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.665 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.689 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.254 | 18 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.190 | 4958 |
| us-east-2 | 0.214 | 1677 |
| us-gov-east-1 | 0.200 | 1810 |
| us-gov-west-1 | 0.169 | 214 |
| us-west-1 | 0.120 | 3909 |
| us-west-2 | 0.170 | 175 |

