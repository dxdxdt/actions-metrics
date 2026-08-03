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
Updated: 2026-08-03T23:02:59.305770+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.623 |  |
| ap-east-2 | 0.563 |  |
| ap-northeast-1 | 0.447 |  |
| ap-northeast-2 | 0.554 |  |
| ap-northeast-3 | 0.472 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.700 |  |
| ap-southeast-2 | 0.601 |  |
| ap-southeast-3 | 0.756 |  |
| ap-southeast-4 | 0.642 |  |
| ap-southeast-5 | 0.720 |  |
| ap-southeast-6 | 0.631 |  |
| ap-southeast-7 | 0.803 |  |
| ca-central-1 | 0.304 | 17 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.595 |  |
| eu-north-1 | 0.622 |  |
| eu-south-1 | 0.605 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.500 |  |
| eu-west-2 | 0.539 |  |
| eu-west-3 | 0.555 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.696 |  |
| us-east-1 | 0.252 | 4936 |
| us-east-2 | 0.263 | 1673 |
| us-gov-east-1 | 0.236 | 1800 |
| us-gov-west-1 | 0.112 | 210 |
| us-west-1 | 0.081 | 3880 |
| us-west-2 | 0.111 | 172 |

