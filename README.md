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
Updated: 2026-03-19T22:20:53.321126+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.709 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.254 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.578 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.513 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.709 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.875 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.183 | 4310 |
| us-east-2 | 0.169 | 1437 |
| us-gov-east-1 | 0.168 | 1590 |
| us-gov-west-1 | 0.157 | 189 |
| us-west-1 | 0.121 | 3262 |
| us-west-2 | 0.158 | 148 |

