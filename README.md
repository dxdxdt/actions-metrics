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
Updated: 2026-02-27T07:41:25.971843+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.060 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.643 |  |
| ap-southeast-5 | 0.743 |  |
| ap-southeast-6 | 0.656 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.296 | 16 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.571 |  |
| eu-central-2 | 0.590 |  |
| eu-north-1 | 0.626 |  |
| eu-south-1 | 0.596 |  |
| eu-south-2 | 0.599 |  |
| eu-west-1 | 0.485 |  |
| eu-west-2 | 0.521 |  |
| eu-west-3 | 0.542 |  |
| il-central-1 | 0.752 |  |
| me-central-1 | 0.946 |  |
| me-south-1 | 0.909 |  |
| mx-central-1 | 0.275 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.237 | 4193 |
| us-east-2 | 0.231 | 1381 |
| us-gov-east-1 | 0.234 | 1513 |
| us-gov-west-1 | 0.135 | 162 |
| us-west-1 | 0.079 | 3130 |
| us-west-2 | 0.138 | 132 |

