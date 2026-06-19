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
Updated: 2026-06-19T19:28:37.114576+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.034 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.478 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.503 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.729 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.660 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.651 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.273 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.587 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.584 |  |
| eu-west-1 | 0.472 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.707 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.676 |  |
| us-east-1 | 0.221 | 4773 |
| us-east-2 | 0.193 | 1635 |
| us-gov-east-1 | 0.200 | 1714 |
| us-gov-west-1 | 0.141 | 198 |
| us-west-1 | 0.086 | 3682 |
| us-west-2 | 0.142 | 163 |

