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
Updated: 2026-08-26T13:47:24.758216+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.721 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.146 | 18 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.109 | 5071 |
| us-east-2 | 0.116 | 1684 |
| us-gov-east-1 | 0.125 | 1886 |
| us-gov-west-1 | 0.249 | 228 |
| us-west-1 | 0.188 | 4060 |
| us-west-2 | 0.248 | 188 |

