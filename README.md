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
Updated: 2026-02-21T11:16:30.903226+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.779 |  |
| ap-southeast-6 | 0.711 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.701 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.638 |  |
| us-east-1 | 0.178 | 4157 |
| us-east-2 | 0.156 | 1360 |
| us-gov-east-1 | 0.157 | 1498 |
| us-gov-west-1 | 0.162 | 160 |
| us-west-1 | 0.139 | 3091 |
| us-west-2 | 0.173 | 129 |

