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
Updated: 2026-04-25T15:34:15.543373+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.851 |  |
| ap-southeast-7 | 0.985 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.561 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.064 | 4564 |
| us-east-2 | 0.093 | 1528 |
| us-gov-east-1 | 0.090 | 1664 |
| us-gov-west-1 | 0.322 | 194 |
| us-west-1 | 0.255 | 3477 |
| us-west-2 | 0.303 | 157 |

