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
Updated: 2026-06-19T09:00:33.378018+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.682 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.791 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.355 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.856 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.108 | 4772 |
| us-east-2 | 0.139 | 1635 |
| us-gov-east-1 | 0.134 | 1714 |
| us-gov-west-1 | 0.253 | 198 |
| us-west-1 | 0.202 | 3679 |
| us-west-2 | 0.261 | 163 |

