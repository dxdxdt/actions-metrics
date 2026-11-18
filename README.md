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
Updated: 2026-11-18T01:27:40.131449+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.746 |  |
| ap-east-1 | 0.529 |  |
| ap-east-2 | 0.482 |  |
| ap-northeast-1 | 0.392 |  |
| ap-northeast-2 | 0.473 |  |
| ap-northeast-3 | 0.411 |  |
| ap-south-1 | 0.670 |  |
| ap-south-2 | 0.693 |  |
| ap-southeast-1 | 0.587 |  |
| ap-southeast-2 | 0.512 |  |
| ap-southeast-3 | 0.631 |  |
| ap-southeast-4 | 0.568 |  |
| ap-southeast-5 | 0.599 |  |
| ap-southeast-6 | 0.538 |  |
| ap-southeast-7 | 0.662 |  |
| ca-central-1 | 0.137 | 18 |
| ca-west-1 | 0.159 |  |
| eu-central-1 | 0.380 |  |
| eu-central-2 | 0.393 |  |
| eu-north-1 | 0.414 |  |
| eu-south-1 | 0.393 |  |
| eu-south-2 | 0.389 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.357 |  |
| il-central-1 | 0.497 |  |
| me-central-1 | 0.654 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.670 |  |
| mx-central-1 | 0.160 |  |
| sa-east-1 | 0.453 |  |
| us-east-1 | 0.116 | 5188 |
| us-east-2 | 0.097 | 1730 |
| us-gov-east-1 | 0.106 | 1962 |
| us-gov-west-1 | 0.138 | 247 |
| us-west-1 | 0.104 | 4219 |
| us-west-2 | 0.139 | 198 |

