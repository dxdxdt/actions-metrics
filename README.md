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
Updated: 2026-04-14T21:52:56.090271+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.687 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.449 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.396 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.095 | 4504 |
| us-east-2 | 0.118 | 1500 |
| us-gov-east-1 | 0.120 | 1647 |
| us-gov-west-1 | 0.292 | 193 |
| us-west-1 | 0.219 | 3412 |
| us-west-2 | 0.280 | 155 |

