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
Updated: 2026-10-09T14:50:15.837509+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.198 | 18 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.437 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.874 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.146 | 5143 |
| us-east-2 | 0.167 | 1692 |
| us-gov-east-1 | 0.182 | 1935 |
| us-gov-west-1 | 0.220 | 237 |
| us-west-1 | 0.158 | 4162 |
| us-west-2 | 0.220 | 194 |

