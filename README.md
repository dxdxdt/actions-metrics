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
Updated: 2026-08-11T23:32:19.604934+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.054 |  |
| ap-east-1 | 0.631 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.477 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.858 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.767 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.731 |  |
| ap-southeast-6 | 0.662 |  |
| ap-southeast-7 | 0.816 |  |
| ca-central-1 | 0.291 | 18 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.569 |  |
| eu-central-2 | 0.590 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.590 |  |
| eu-south-2 | 0.597 |  |
| eu-west-1 | 0.483 |  |
| eu-west-2 | 0.517 |  |
| eu-west-3 | 0.552 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.950 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.228 | 4976 |
| us-east-2 | 0.277 | 1679 |
| us-gov-east-1 | 0.261 | 1822 |
| us-gov-west-1 | 0.129 | 219 |
| us-west-1 | 0.126 | 3927 |
| us-west-2 | 0.130 | 176 |

