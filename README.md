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
Updated: 2026-10-09T19:57:14.924362+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.642 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.167 | 18 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.469 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.424 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.630 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.142 | 5143 |
| us-east-2 | 0.125 | 1693 |
| us-gov-east-1 | 0.143 | 1935 |
| us-gov-west-1 | 0.216 | 237 |
| us-west-1 | 0.158 | 4162 |
| us-west-2 | 0.218 | 194 |

