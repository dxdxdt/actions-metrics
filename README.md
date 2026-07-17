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
Updated: 2026-07-17T09:49:45.774072+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.978 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.200 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.504 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.150 | 4875 |
| us-east-2 | 0.154 | 1656 |
| us-gov-east-1 | 0.132 | 1762 |
| us-gov-west-1 | 0.199 | 202 |
| us-west-1 | 0.147 | 3791 |
| us-west-2 | 0.200 | 166 |

