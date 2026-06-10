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
Updated: 2026-06-10T10:59:51.340385+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.721 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.486 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.882 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.128 | 4739 |
| us-east-2 | 0.119 | 1630 |
| us-gov-east-1 | 0.128 | 1710 |
| us-gov-west-1 | 0.248 | 198 |
| us-west-1 | 0.189 | 3654 |
| us-west-2 | 0.246 | 162 |

