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
Updated: 2026-02-15T23:19:15.690646+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.684 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.779 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.775 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.092 | 4127 |
| us-east-2 | 0.093 | 1347 |
| us-gov-east-1 | 0.093 | 1475 |
| us-gov-west-1 | 0.246 | 148 |
| us-west-1 | 0.240 | 3063 |
| us-west-2 | 0.248 | 125 |

