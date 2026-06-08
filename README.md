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
Updated: 2026-06-08T14:43:11.155998+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.809 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.890 |  |
| ap-southeast-2 | 0.794 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.836 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.430 |  |
| eu-south-1 | 0.417 |  |
| eu-south-2 | 0.417 |  |
| eu-west-1 | 0.302 |  |
| eu-west-2 | 0.343 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.538 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.058 | 4735 |
| us-east-2 | 0.093 | 1628 |
| us-gov-east-1 | 0.101 | 1709 |
| us-gov-west-1 | 0.322 | 198 |
| us-west-1 | 0.275 | 3646 |
| us-west-2 | 0.318 | 162 |

