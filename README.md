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
Updated: 2026-03-30T22:27:54.595464+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.799 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.166 | 16 |
| ca-west-1 | 0.296 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.768 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.111 | 4403 |
| us-east-2 | 0.126 | 1467 |
| us-gov-east-1 | 0.129 | 1615 |
| us-gov-west-1 | 0.262 | 190 |
| us-west-1 | 0.201 | 3323 |
| us-west-2 | 0.261 | 152 |

