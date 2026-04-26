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
Updated: 2026-04-26T17:33:26.535758+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.683 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.731 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.521 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.164 | 4567 |
| us-east-2 | 0.172 | 1535 |
| us-gov-east-1 | 0.155 | 1665 |
| us-gov-west-1 | 0.203 | 194 |
| us-west-1 | 0.146 | 3486 |
| us-west-2 | 0.200 | 157 |

