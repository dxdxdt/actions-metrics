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
Updated: 2026-02-16T14:50:43.280140+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.687 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.669 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.834 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.410 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.797 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.565 |  |
| us-east-1 | 0.097 | 4129 |
| us-east-2 | 0.076 | 1348 |
| us-gov-east-1 | 0.074 | 1479 |
| us-gov-west-1 | 0.218 | 149 |
| us-west-1 | 0.242 | 3065 |
| us-west-2 | 0.218 | 126 |

