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
Updated: 2026-08-27T13:25:32.773268+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.066 |  |
| ap-east-1 | 0.623 |  |
| ap-east-2 | 0.561 |  |
| ap-northeast-1 | 0.445 |  |
| ap-northeast-2 | 0.554 |  |
| ap-northeast-3 | 0.471 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.702 |  |
| ap-southeast-2 | 0.583 |  |
| ap-southeast-3 | 0.758 |  |
| ap-southeast-4 | 0.627 |  |
| ap-southeast-5 | 0.718 |  |
| ap-southeast-6 | 0.617 |  |
| ap-southeast-7 | 0.804 |  |
| ca-central-1 | 0.323 | 18 |
| ca-west-1 | 0.183 |  |
| eu-central-1 | 0.583 |  |
| eu-central-2 | 0.623 |  |
| eu-north-1 | 0.648 |  |
| eu-south-1 | 0.611 |  |
| eu-south-2 | 0.616 |  |
| eu-west-1 | 0.512 |  |
| eu-west-2 | 0.548 |  |
| eu-west-3 | 0.565 |  |
| il-central-1 | 0.752 |  |
| me-central-1 | 0.977 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.708 |  |
| us-east-1 | 0.254 | 5071 |
| us-east-2 | 0.262 | 1684 |
| us-gov-east-1 | 0.267 | 1887 |
| us-gov-west-1 | 0.118 | 228 |
| us-west-1 | 0.058 | 4064 |
| us-west-2 | 0.115 | 189 |

