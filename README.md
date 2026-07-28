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
Updated: 2026-07-28T21:01:05.729144+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.074 |  |
| ap-east-1 | 0.621 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.446 |  |
| ap-northeast-2 | 0.551 |  |
| ap-northeast-3 | 0.474 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.700 |  |
| ap-southeast-2 | 0.578 |  |
| ap-southeast-3 | 0.755 |  |
| ap-southeast-4 | 0.619 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.613 |  |
| ap-southeast-7 | 0.806 |  |
| ca-central-1 | 0.323 | 17 |
| ca-west-1 | 0.174 |  |
| eu-central-1 | 0.587 |  |
| eu-central-2 | 0.625 |  |
| eu-north-1 | 0.648 |  |
| eu-south-1 | 0.619 |  |
| eu-south-2 | 0.623 |  |
| eu-west-1 | 0.506 |  |
| eu-west-2 | 0.552 |  |
| eu-west-3 | 0.569 |  |
| il-central-1 | 0.748 |  |
| me-central-1 | 0.987 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.706 |  |
| us-east-1 | 0.262 | 4916 |
| us-east-2 | 0.226 | 1670 |
| us-gov-east-1 | 0.234 | 1782 |
| us-gov-west-1 | 0.104 | 207 |
| us-west-1 | 0.050 | 3850 |
| us-west-2 | 0.105 | 171 |

