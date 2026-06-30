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
Updated: 2026-06-30T22:11:14.791417+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.549 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.172 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.490 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.142 | 4805 |
| us-east-2 | 0.120 | 1649 |
| us-gov-east-1 | 0.123 | 1725 |
| us-gov-west-1 | 0.219 | 200 |
| us-west-1 | 0.167 | 3724 |
| us-west-2 | 0.217 | 163 |

