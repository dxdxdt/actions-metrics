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
Updated: 2026-05-10T23:43:24.921383+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.703 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.178 | 4624 |
| us-east-2 | 0.165 | 1587 |
| us-gov-east-1 | 0.174 | 1685 |
| us-gov-west-1 | 0.188 | 195 |
| us-west-1 | 0.142 | 3548 |
| us-west-2 | 0.185 | 158 |

