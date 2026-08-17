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
Updated: 2026-08-17T07:45:11.751521+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.714 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.819 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.166 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.632 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.135 | 5011 |
| us-east-2 | 0.143 | 1680 |
| us-gov-east-1 | 0.121 | 1836 |
| us-gov-west-1 | 0.216 | 224 |
| us-west-1 | 0.183 | 3973 |
| us-west-2 | 0.216 | 181 |

