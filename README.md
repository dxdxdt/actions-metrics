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
Updated: 2026-03-05T23:46:04.663223+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.076 |  |
| ap-east-1 | 0.627 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.476 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.702 |  |
| ap-southeast-2 | 0.581 |  |
| ap-southeast-3 | 0.758 |  |
| ap-southeast-4 | 0.619 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.655 |  |
| ap-southeast-7 | 0.805 |  |
| ca-central-1 | 0.298 | 16 |
| ca-west-1 | 0.177 |  |
| eu-central-1 | 0.591 |  |
| eu-central-2 | 0.599 |  |
| eu-north-1 | 0.637 |  |
| eu-south-1 | 0.614 |  |
| eu-south-2 | 0.615 |  |
| eu-west-1 | 0.510 |  |
| eu-west-2 | 0.538 |  |
| eu-west-3 | 0.561 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 0.961 |  |
| me-south-1 | 0.926 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.706 |  |
| us-east-1 | 0.263 | 4226 |
| us-east-2 | 0.235 | 1401 |
| us-gov-east-1 | 0.238 | 1532 |
| us-gov-west-1 | 0.108 | 172 |
| us-west-1 | 0.056 | 3180 |
| us-west-2 | 0.113 | 141 |

