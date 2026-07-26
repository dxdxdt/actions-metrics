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
Updated: 2026-07-26T15:59:03.056462+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.684 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.186 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.153 | 4913 |
| us-east-2 | 0.147 | 1665 |
| us-gov-east-1 | 0.134 | 1779 |
| us-gov-west-1 | 0.211 | 207 |
| us-west-1 | 0.150 | 3838 |
| us-west-2 | 0.210 | 170 |

